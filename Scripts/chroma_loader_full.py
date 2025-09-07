import os
import chromadb
import git_parser as gp
import tiktoken


def num_tokens(text, enc):
    return len(enc.encode(text))


class ChromaFullLoader:
    def __init__(self, base_path):
        self.base_path = base_path


    def create_collection(self,collection_name):
        """Drops and recreate a new collection"""
        os.makedirs(self.base_path, exist_ok=True)

        # Use a persistent client that saves to disk
        chroma_client = chromadb.PersistentClient(path=self.base_path)
        COLLECTION_NAME = collection_name


        if any(c.name == COLLECTION_NAME for c in chroma_client.list_collections()):
            chroma_client.delete_collection(COLLECTION_NAME)
        collection = chroma_client.get_or_create_collection(name=COLLECTION_NAME)
        return collection


    def load_documents(self, collection):
        """Runs a full load into a collection. Uses table name as id"""
        enc = tiktoken.encoding_for_model("gpt-4o-mini") # for token calculation
        ids, documents, metadatas = [], [], []
        for table_name, table_data in tables.items():
            sha, size, ddl = table_data[0], table_data[1], table_data[2]
            tokens = num_tokens(ddl, enc)
            doc_id = table_name # crated id as table name, contains only last changes

            ids.append(doc_id)
            documents.append(ddl)
            metadatas.append({ "table_name": table_name,"sha": sha,"size": size, "tokens": tokens })

        collection.upsert(ids=ids, documents=documents, metadatas=metadatas)

if __name__ == '__main__':
    # Pull GitHub files
    get_objects = gp.GitParser(
        r'https://api.github.com/repos/Pavlikkkk/AdventureWorks/contents/Chinook',
        os.getenv('GITHUB_TOKEN_Adventure_Work')
    )
    tables, errors = get_objects.get_git_objects(['ddl'])
    # Create and load collection
    objects = ChromaFullLoader("your_path")
    collection = objects.create_collection("your_collection_name")
    objects.load_documents(collection)
    # Sanity check
    print("Collection:", collection.name)
    print("Count:", collection.count())

