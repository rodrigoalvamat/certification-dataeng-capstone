"""Defines a Config class to read the AWS EMR configuration from etl.cfg file."""

# sys libs
import os
# config libs
import configparser

SCRIPT_NAME = os.path.basename(__file__)
"""The python script file name."""
SCRIPT_PATH = os.path.abspath(__file__)
"""The python script absolute file path."""
SCRIPT_DIR = SCRIPT_PATH.replace(f'/{SCRIPT_NAME}', '')
"""The python script directory path."""

CONFIG_NAME = 'capstone.cfg'
"""The config file name."""
CONFIG_PATH = os.path.join(SCRIPT_DIR, CONFIG_NAME)
"""The config file absolute path in the local environment."""


class Config:
    """This class defines a wrapper for ConfigParser.

    Use the etl.cfg file as a reference to configure
    the application according to your AWS account settings.

    Usage example:

    config = Config()
    config.get('S3', 'LANDING')
    """

    def __init__(self):
        """Creates a Config object from pipeline.cfg file.

        Config values will be UTF-8 encoded.

        Args:
            local: Defines if the data will be loaded and stored locally.
        """
        self.parser = configparser.ConfigParser()
        self.parser.read_file(open(CONFIG_PATH, encoding='utf-8'))

    def get(self, section, option):
        """Reads a config option value from a section.

        Retrieves an option value pertaining to the given section
        from the etl.cfg file.

        Args:
            section: The etl.cfg file section name.
              E.g. EMR
            option: The section config option name.
              E.g. CLUSTER_ID

        Returns:
            A value to the given section and option.
            For example:

            value = config.get('EMR', 'CLUSTER_ID')
        """
        return self.parser.get(section, option)
