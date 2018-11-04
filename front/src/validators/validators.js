class Validators {

    static isDefined(value) {
        /*
        Check if value is defined
        :param value: your variable
        :return: True if value is defined, False if not
        */

        if (value == "undefined" || value == null) {
            return false;
        } else {
            return true;
        }
    
    }

}

export default Validators;