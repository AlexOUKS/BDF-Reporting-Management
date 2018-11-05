class Validators {

    static isDefined(value) {
        /*
        Check if value is defined
        :param value: your variable
        :return: True if value is defined, False if not
        */

        return (value == "undefined" || value == null) ? false : true;
    
    }

    static fields_not_empty(array) {
        /*
        Check if fields are not empty
        :param array: array of values
        :return: True if values of array's key is not empty, Array of keys where values are empty
        */

        let errors = []
        for (var key in array) {
            if (!this.isDefined(array[key]) || array[key] === "")
                errors.push(key);
        }

        return (errors.length === 0) ?  true :  errors;
    
    }

}

export default Validators;