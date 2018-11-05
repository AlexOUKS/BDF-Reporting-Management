import React, { Component } from 'react';
import axios from 'axios';
import Validators from '../validators/validators'
import { Row, Col, Card, Table, Button, Badge, Modal, ModalBody, CustomInput, ModalHeader, Input, FormGroup, ModalFooter} from 'reactstrap';
import modify from './img/edit.svg';
import deleteimg from './img/rubbish-bin.svg';
import plus from './img/add.svg';
import './NewUser.css';

class NewUser extends Component {
    constructor(props){
        super(props);
        this.state = {
            users: [],
            modalNewUser: false,
            modalEditUser: false,
            modalDeleteUser: false,
            currentUser : {}
        }

        this.getValues = this.getValues.bind(this);
        this.createUser = this.createUser.bind(this);
        
    }

   
    componentDidMount() {
        axios.get(process.env.REACT_APP_API_URL+'/authBDF/getUsers')
            .then(res =>  {
                const users = res.data;
                this.setState({ users });
                this.showUsers();
              });
        
        
    }

    showUsers() {

        let table = []

        if (Validators.isDefined(this.state.users.data)) {
            for (let i=0; i < Object.keys(this.state.users.data).length; i++) {
                let user = this.state.users.data[i];
                table.push(
                    <tr>
                        <th> {user.login} </th>
                        <th> {user.dateDerniereConnexion} </th>
                        <th> {user.dateCreation} </th>
                        <th> <Badge color="secondary">{user.niveauAuth}</Badge> </th>
                        <th> 
                            <Button color="warning" onClick={this.showModal.bind(this, 'modalEditUser', user)}><img src={modify} /></Button>{' '}
                            <Button color="danger" onClick={this.showModal.bind(this, 'modalDeleteUser', user.login)}><img src={deleteimg} /></Button>{' '}
                        </th>
                    </tr>);
            }
        }
        
        
        return table;
   
    }

    getValues(event, field) {
        this.setState({
          [field]: event.target.value
        });
    }

    closeModal(tabId) {
        this.setState({
            [tabId]: false
        });
    }

    showModal(modal, user) {
        this.setState({
            [modal]: true,
            "currentUser" : user
        });
    }

    createUser() {
        let fields = {
            "login" : this.state.login,
            "mdp" : this.state.mdp,
            "nivAuth" : this.state.niveauAuth,
        }
        
        let inputs = document.querySelectorAll('input, select');
        for (let index = 0; index < inputs.length; ++index) {
            inputs[index].classList.remove("error-input");
        }
 
        let isValid = Validators.fields_not_empty(fields);

        if (isValid === true) {
            axios.post(process.env.REACT_APP_API_URL+'/authBDF/newUser', 
                {
                    'login' : this.state.login,
                    'mdp' : this.state.mdp, 
                    'niveauAuth' : this.state.niveauAuth
                },
                {
                    headers : {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                } 
                )
                .then(r => {
                    this.closeModal("modalNewUser");
                    // A changer si possible, mauvaise méthode..
                    //eslint-disable-next-line
                    window.location.reload();
                })
                .catch((r) => {alert("L'utilisateur est déjà existant")});
            
        } else {
            for (var key in isValid) {
                document.getElementById(isValid[key]).classList.add("error-input");
            }
        }
    }

    deleteUser(user) {
        axios.delete(process.env.REACT_APP_API_URL+'/authBDF/deleteUser', 
                {data :     
                    {
                        'login' : user,
                    },
                },
                {
                    headers : {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                } 
                )
            .then(r => {
                this.closeModal("modalDeleteUser");
                // A changer si possible, mauvaise méthode..
                //eslint-disable-next-line
                window.location.reload();
            })
            .catch((r) => {alert("L'utilisateur n'existe pas")}); 
    }
      
    editUser(user) {

        let fields = {
            "login" : document.getElementById("login").value,
            "mdp" : document.getElementById("mdp").value,
            "nivAuth" : document.getElementById("nivAuth").value,
        }
        
        let inputs = document.querySelectorAll('input, select');
        for (let index = 0; index < inputs.length; ++index) {
            inputs[index].classList.remove("error-input");
        }
 
        let isValid = Validators.fields_not_empty(fields);

        if (isValid === true) {

        axios.put(process.env.REACT_APP_API_URL+'/authBDF/editUser', 
                     
                {
                    "login" : document.getElementById("login").value,
                    'mdp' : document.getElementById("mdp").value, 
                    'niveauAuth' : document.getElementById("nivAuth").value
                },
                {
                    headers : {
                        'Content-Type': 'application/x-www-form-urlencoded'
                    }
                } 
                )
            .then(r => {
                this.closeModal("modalEditUser");
                // A changer si possible, mauvaise méthode..
                //eslint-disable-next-line
                window.location.reload();
            })
            .catch((r) => {alert("L'utilisateur n'existe pas")}); 

            } else {
                for (var key in isValid) {
                    document.getElementById(isValid[key]).classList.add("error-input");
                }
            }
    }
    // ----------------------- VUE HTML -----------------------------

    render() {
        return (
            <div>
                <Row>
                    <Col>
                        <h3>
                            Gestions des utilisateurs
                        </h3>
                    </Col>
                </Row>
                <hr />
                <Row>
                    <Col>
                        <Button color="success" onClick={this.showModal.bind(this, 'modalNewUser')}><img src={plus} className="NewUser"/> Nouvel utilisateur</Button>{' '}
                    </Col>
                </Row>
                <Row>
                    <Col lg="8">
                        <Card>
                        <Table className="TableUsers">
                            <thead>
                            <tr>
                                <th>Login</th>
                                <th>Dernière connexion</th>
                                <th>Date création compte</th>
                                <th>Niveau d'authentification</th>
                                <th>Actions </th>
                            </tr>
                            </thead>
                            <tbody>
                        
                              {this.showUsers()}
                            
                            </tbody>
                        </Table>
                        </Card>
                    </Col>
                </Row>
                <Modal isOpen={this.state.modalNewUser} toggle={this.closeModal.bind(this, 'modalNewUser')}>
                    <ModalHeader toggle={this.closeModal.bind(this, 'modalNewUser')}>
                        Ajouter un nouvel utilisateur
                    </ModalHeader>
                    <ModalBody>
                        <FormGroup>
                            <Input onChange={evt => this.getValues(evt, 'login')} name="login" id="login" placeholder="Login" />
                        </FormGroup>
                        <FormGroup>
                            <Input onChange={evt => this.getValues(evt, 'mdp')} type="password" name="password" id="mdp" placeholder="Mot de passe" />
                        </FormGroup>
                        <FormGroup>
                            <CustomInput onChange={evt => this.getValues(evt, 'niveauAuth')} type="select" id="nivAuth" name="nivAuth">
                                <option value="">Niveau d'authentification</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </CustomInput>
                        </FormGroup>
                        <ModalFooter>
                            <Button color="success" className="SubmitButton" onClick={this.createUser}>Création</Button>
                            <Button color="warning" className="SubmitButton" onClick={this.closeModal.bind(this, 'modalNewUser')}>Annuler</Button>
                        </ModalFooter>
                    </ModalBody>
                </Modal>
                <Modal isOpen={this.state.modalEditUser} toggle={this.closeModal.bind(this, 'modalEditUser')}>
                    <ModalHeader toggle={this.closeModal.bind(this, 'modalNewUser')}>
                            Éditer l'utilisateur <b>{this.state.currentUser.login}</b>
                    </ModalHeader>
                    <ModalBody>
                        <FormGroup>
                            <Input onChange={evt => this.getValues(evt, 'login')} value={this.state.currentUser.login} name="login" id="login" placeholder="Login" disabled/>
                        </FormGroup>
                        <FormGroup>
                            <Input onChange={evt => this.getValues(evt, 'mdp')} type="password" name="password" id="mdp" placeholder="Nouveau mot de passe" />
                        </FormGroup>
                        <FormGroup>
                            <CustomInput onChange={evt => this.getValues(evt, 'niveauAuth')} type="select" id="nivAuth" name="nivAuth">
                                <option value="">Niveau d'authentification</option>
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>
                                <option>5</option>
                            </CustomInput>
                        </FormGroup>
                        <ModalFooter>
                            <Button color="success" className="SubmitButton" onClick={this.editUser.bind(this, this.state.currentUser)}>Modifier</Button>
                            <Button color="warning" className="SubmitButton" onClick={this.closeModal.bind(this, 'modalEditUser')}>Annuler</Button>
                        </ModalFooter>
                    </ModalBody>
                </Modal>
                <Modal isOpen={this.state.modalDeleteUser} toggle={this.closeModal.bind(this, 'modalDeleteUser')}>
                    <ModalHeader toggle={this.closeModal.bind(this, 'modalDeleteUser')}>
                        Suppression d'un utilisateur
                    </ModalHeader>
                    <ModalBody>
                        Êtes-vous sur de supprimer l'utilisateur <b> {this.state.currentUser} </b> ?
                    </ModalBody>
                    <ModalFooter>
                        <Button color="danger" className="SubmitButton" onClick={this.deleteUser.bind(this, this.state.currentUser)}>Supprimer</Button>
                        <Button color="warning" className="SubmitButton" onClick={this.closeModal.bind(this, 'modalDeleteUser')}>Annuler</Button>
                    </ModalFooter>
                    
                </Modal>
            </div>
        )
    }
}


export default NewUser;