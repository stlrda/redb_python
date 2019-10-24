from python.download_city_file import download_city_file
from python.list_files import listfiles
from python.retrieve_city_file_array import files_to_download
from python.variables import entity_database_name, source_urls, lambda_folder
from python.unzip_files_in_directory import unpack_dir
import os

os.environ['http_proxy']=''

#Create function looping through, downloading files to ~

db_file_array = files_to_download(source_urls)

# for each array row in 'db_file_array'
for row in db_file_array[2]:
    # download into lambda_folder directory
    download_city_file(row, lambda_folder)

listfiles(lambda_folder)

#unpack all zip files in lambda_folder directory
unpack_dir(lambda_folder)

listfiles(lambda_folder)





#determine file type and read

#export to ~ delimited file, save to S3

#Boto is library for AWS functions*