import React, { Component } from 'react';
import axios from 'axios';
import Validators from '../validators/validators'
import { Row, Col, Card, Table, Button, Badge} from 'reactstrap';
import modify from './img/edit.svg';
import deleteimg from './img/rubbish-bin.svg';
import plus from './img/add.svg';
import './NewUser.css';

class NewUser extends Component {
    constructor(props){
        super(props);
        this.state = {
            users: []
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
                            <Button color="warning"><img src={modify} /></Button>{' '}
                            <Button color="danger"><img src={deleteimg} /></Button>{' '}
                        </th>
                    </tr>);
            }
        }
        
        
        return table;
   
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
                        <Button color="success"><img src={plus} className="NewUser"/> Nouvel utilisateur</Button>{' '}
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
            </div>
        )
    }
}


export default NewUser;