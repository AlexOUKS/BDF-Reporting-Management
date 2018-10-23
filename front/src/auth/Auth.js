import React, { Component } from 'react';
import axios from 'axios';
import logo from '../img/bdf.jpg';
import lock from './img/lock.png';
import user from './img/user.png';
import './Auth.css';
import { Button, FormGroup, Label, Input, Alert} from 'reactstrap';

class Auth extends Component {
  constructor(props) {
    super(props);

    this.state = {
      login: '',
      mdp: '',
      loginError :  false,
    };

    this.loginChange = this.loginChange.bind(this);
    this.mdpChange = this.mdpChange.bind(this);
    this.login = this.login.bind(this);
  }

  loginChange(event) {
    this.setState({login: event.target.value});
  }

  mdpChange(event) {
    this.setState({mdp: event.target.value});

  }


  login() {
    axios.post(process.env.REACT_APP_API_URL+'/authBDF/login', 
    
    this.state, 
    {
      headers : {
        'Content-Type': 'application/x-www-form-urlencoded; charset=UTF-8'
      }
    }
    )
      .then(response => Auth.loginOk)
      .catch(error => Auth.loginFail);
  }

  loginOk() {

  }

  loginFail() {
    this.state.loginError = true;
  }

  // ----------------------- VUE HTML -----------------------------

  render() {
    return (
      <div className="Auth">
        <div className="AuthRightBlock">
        
          <div className="LoginBlock">
            <Alert className={this.state.loginError ? 'hidden' : ''} color="danger">
              Identifiants incorrects
            </Alert>
            <div className="InnerBlockLogin"> 
              <FormGroup>
                <img className="ImgLoginBlock" src={user} />
                <Label for="exampleEmail">Login</Label>
                <Input onChange={this.loginChange}></Input>
              </FormGroup>
              <FormGroup>
                <img className="ImgLoginBlock" src={lock} />
                <Label for="examplePassword">Mot de passe</Label>
                <Input onChange={this.mdpChange} type="password" name="password" />
              </FormGroup>
              <Button  onClick={this.login} className="ButtonLogin" outline color="primary">Connexion</Button>{' '}
            </div>
          </div>
        </div>
        <div className="AuthLeftBlock">
            <img className="ImgLogo" src={logo} />
        </div>
      </div>
    );
  }
}

export default Auth;
