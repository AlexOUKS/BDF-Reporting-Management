import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import Auth from './auth/Auth';
import * as serviceWorker from './auth/serviceWorker';

ReactDOM.render(<Auth />, document.getElementById('root'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: http://bit.ly/CRA-PWA
serviceWorker.unregister();