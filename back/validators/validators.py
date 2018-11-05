from django.core.exceptions import ValidationError
from django.http import HttpResponseForbidden
import hashlib, json

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

    @staticmethod
    def keys_are_inside_arrays(array, keys):
        """
        Check if the array have the keys wanted
        :param array: array
        :param keys: array of keys
        :return: True if all keys exists inside array, array of keys missing if one or more keys doesn't exist
        """

        errors = []

        for key in keys:
            if Validators.key_exists(array, key) == False:
                errors.append(key)

        if errors:
            return errors
        else:
            return True

    @staticmethod
    def is_valid_json(jsonInput):
        """
        Check if the json received is good formatted
        :param array: JSON
        :return: True if JSON is valid, False if not
        """

        try: 
            data = json.loads(jsonInput)
        except ValueError:
            return False

        return data

if __name__ == "__main__":
    valid = Validators()
    empty = None
    notEmpty = "admin"
    result = hashlib.md5(notEmpty.encode())
    print(result.hexdigest())