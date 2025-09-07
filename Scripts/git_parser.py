import os
import requests
import base64


class GitParser:
    def __init__(self, url, token):
        self.api_url = url
        self.GITHUB_TOKEN = token

        self.headers = {
            'Authorization': f'token {self.GITHUB_TOKEN}',
            'Accept': 'application/vnd.github.v3+json',
            'User-Agent': 'GitHub_parser',
            'Content-Type': 'application/json'
        }


    def get_git_objects(self, paths):
        """Connect to gitHub and retrieves files with metadata"""
        git_objects = {}
        error_msg = []
        for path in paths:
            api_url = f"{self.api_url}/{path}"
            response = requests.get(api_url, headers=self.headers )
            if response.status_code != 200:
                error_msg.append(f'{path} {response}')
            if response.status_code == 200:
                files = response.json()
                for file in files:
                    file_response = requests.get(api_url + '/' + file['name'], headers=self.headers )
                    files_data = file_response.json()
                    git_objects[files_data['name']] = [files_data['sha'], files_data['size'],
                                                       base64.b64decode(files_data['content']).decode('utf-8')]
        return git_objects, error_msg

if __name__ == '__main__':
    # get_objects = GitParser(r'https://api.github.com/repos/Pavlikkkk/AdventureWorks/contents/dbo', os.getenv('GITHUB_TOKEN_Adventure_Work'))
    # print(get_objects.get_git_objects(['tables','func', 'views']))
    get_objects = GitParser(r'https://api.github.com/repos/Pavlikkkk/AdventureWorks/contents/Chinook',
                            os.getenv('GITHUB_TOKEN_Adventure_Work'))
    print(get_objects.get_git_objects(['ddl']))
