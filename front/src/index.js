import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import 'bootstrap/dist/css/bootstrap.min.css';
import Auth from './auth/Auth';
import Menu from './menu/Menu';
import * as serviceWorker from './auth/serviceWorker';
require('dotenv').config()

if (!sessionStorage.getItem('login')) {
    ReactDOM.render(<Auth />, document.getElementById('root'));
} else {
   ReactDOM.render(<Menu />, document.getElementById('root'));
}


// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: http://bit.ly/CRA-PWA
serviceWorker.unregister();
