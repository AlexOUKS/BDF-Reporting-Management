import React, { Component } from 'react';
import axios from 'axios';
import Validators from '../validators/validators'
import { Row, Col, Card, Table, Button, Badge, Modal, ModalBody, ModalFooter, ModalHeader} from 'reactstrap';
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
            modalDeleteUser: false
        }

        
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
                            <Button color="warning" onClick={this.showModal.bind(this, 'modalEditUser')}><img src={modify} /></Button>{' '}
                            <Button color="danger" onClick={this.showModal.bind(this, 'modalDeleteUser')}><img src={deleteimg} /></Button>{' '}
                        </th>
                    </tr>);
            }
        }
        
        
        return table;
   
    }

      closeModal(tabId) {
        this.setState({
          [tabId]: false
        });
      }
      showModal(modal) {
        this.setState({
          [modal]: true
        });
        console.log(this.state);
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
                        Modal 1
                    </ModalHeader>
                    <ModalBody>
                        <Button onClick={this.showModal.bind(this, 'modalNewUser')}>
                        Show Modal 2
                        </Button>
                    </ModalBody>
                </Modal>
                <Modal isOpen={this.state.modalEditUser} toggle={this.closeModal.bind(this, 'modalEditUser')}>
                    <ModalHeader toggle={this.closeModal.bind(this, 'modalEditUser')}>
                        Modal 2
                    </ModalHeader>
                    <ModalBody>
                        This is Modal 2
                    </ModalBody>
                </Modal>
                <Modal isOpen={this.state.modalDeleteUser} toggle={this.closeModal.bind(this, 'modalDeleteUser')}>
                    <ModalHeader toggle={this.closeModal.bind(this, 'modalDeleteUser')}>
                        Modal 2
                    </ModalHeader>
                    <ModalBody>
                        This is Modal 2
                    </ModalBody>
                </Modal>
            </div>
        )
    }
}


export default NewUser;