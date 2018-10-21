import React, { Component } from 'react';
import logo from '../img/bdf.jpg';
import './Auth.css';

class Auth extends Component {
  render() {
    return (
      <div className="Auth">
        <div className="AuthRightBlock">

        </div>
        <div className="AuthLeftBlock">
            <img className="ImgLogo" src={logo} />
        </div>
      </div>
    );
  }
}

export default Auth;
