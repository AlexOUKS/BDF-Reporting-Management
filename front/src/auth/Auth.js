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

  
  login(e) {
    if(e.key === 'Enter' || e.type === 'click'){
      axios.post(process.env.REACT_APP_API_URL+'/authBDF/login', 
        {'login' : this.state.login,
          'mdp' : this.state.mdp, 
        },
        {
          headers : {
            'Content-Type': 'application/x-www-form-urlencoded'
          }
        } 
        )
        .then(r => this.loginOk(r))
        .catch(r => this.loginFail(r));
      }
  }

  loginOk(response) {
    sessionStorage.setItem('login', '444BCB3A3FCF8389296C49467F27E1D6');
    sessionStorage.setItem('lvl', response.data.lvl);
    this.setState({loginError : false});
    // A changer si possible, mauvaise méthode..
    //eslint-disable-next-line
    //window.location.reload();
  }

  loginFail(response) {
    this.setState({loginError : true});
  }

  // ----------------------- VUE HTML -----------------------------

  render() {
    return (
      <div className="Auth">
        <div className="AuthRightBlock">
          <div className="LoginBlock">
          {this.state.loginError ? <Alert color="danger" >
              Identifiants incorrects
            </Alert> : '' }
            
            <div className="InnerBlockLogin"> 
              <FormGroup>
                <img className="ImgLoginBlock" src={user} />
                <Label for="exampleEmail">Login</Label>
                <Input onChange={this.loginChange} onKeyPress={this.login}></Input>
              </FormGroup>
              <FormGroup>
                <img className="ImgLoginBlock" src={lock} />
                <Label for="examplePassword">Mot de passe</Label>
                <Input onChange={this.mdpChange} onKeyPress={this.login} type="password" name="password" />
              </FormGroup>
              <Button  onClick={this.login} className="ButtonLogin"  outline color="primary">Connexion</Button>{' '}
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
