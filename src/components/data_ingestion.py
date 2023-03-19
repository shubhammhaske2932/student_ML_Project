import os
import sys
from src.exception import CustomException
from src.logger import logging
import pandas as pd
from sklearn.model_selection import train_test_split

#used to create class varaible
from dataclasses import dataclass 

@dataclass
class DataIngestionConfig:
    raw_data_path: str = os.path.join('artifact',"data.csv")
    train_data_path: str = os.path.join('artifact',"train.csv")
    test_data_path: str = os.path.join('artifact',"test.csv")
    
class DataIngestion:
    def __init__(self):
        self.data_ingestion_config = DataIngestionConfig()

    def inititate_data_ingestion(self):
        
        logging.info("Enter the data ingestion method or component")
        
        try:
            df = pd.read_csv(r"data\stud.csv")
            logging.info("Read the dataset as dataframe")
            
            os.makedirs(os.path.dirname(self.data_ingestion_config.train_data_path), exist_ok = True)
            
            df.to_csv(self.data_ingestion_config.raw_data_path, index = False, header = True)

            logging.info("Train test split initiate")

            train_set, test_set = train_test_split(df,test_size =0.2, random_state = 42)

            train_set.to_csv(self.data_ingestion_config.train_data_path, index = False, header = True)

            test_set.to_csv(self.data_ingestion_config.test_data_path, index = False, header = True)

            logging.info("Data Ingestion is completed")

            return(
                self.data_ingestion_config.train_data_path,
                self.data_ingestion_config.test_data_path

            )

        except Exception as e:
            raise CustomException(e,sys)


if __name__ == '__main__':
    obj = DataIngestion()
    obj.inititate_data_ingestion()
