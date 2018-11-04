from django.core.exceptions import ValidationError
import hashlib
class Validators:

    @staticmethod
    def is_type(value, value_type):
        """
        Check if value is certain type
        :param value: It can be list or a single value of anything
        :param value_type: For which python type are we testing the type of value (str, int, float, list...)
        :return: True if value is that type, False if not
        """
        if isinstance(value, value_type):
            return True
        else:  
            return False

    @staticmethod
    def is_not_empty(value):
        """
        Check if value empty
        :param value: It can be list or a single value of anything
        :return: True if value is not empty, False if empty
        """
        if not value or value == "":
            return False
        else:  
            return True

    @staticmethod
    def key_exists(array, key):
        """
        Check if key exists in array
        :param array: array
        :param key: the key in array
        :return: True if key exists, false if doesn't exist
        """
        if key in array:
            return True
        else:  
            return False

if __name__ == "__main__":
    valid = Validators()
    empty = None
    notEmpty = "admin"
    result = hashlib.md5(notEmpty.encode())
    print(result.hexdigest())