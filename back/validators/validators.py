from django.core.exceptions import ValidationError

class Validators:

    @staticmethod
    def is_type(value, value_type):
        """
        Check if value is certain type
        :param value: It can be list or a single value of anything
        :param value_type: For which python type are we testing the type of value (str, int, float, list...)
        :return: True if value is that type, Expection if not
        """
        if isinstance(value, value_type):
            return True
        else:  
            raise ValidationError(
                ('%(value)s is not a %(value_type)s'),
                params={'value': value, 'value_type' : value_type},
            )

    @staticmethod
    def is_not_empty(value):
        """
        Check if value empty
        :param value: It can be list or a single value of anything
        :return: True if value is not empty, Exception if empty
        """
        if value is None:
            raise ValidationError(
                ('%(value)s is empty'),
                params={'value': value},
            )
        else:  
            return True

if __name__ == "__main__":
    valid = Validators()
    empty = None
    notEmpty = "2"
    print(valid.is_type(notEmpty,int))