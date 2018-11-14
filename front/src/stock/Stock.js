import React, { Component } from 'react';
import {Line, Doughnut} from 'react-chartjs-2';

import './Stock.css';
import axios from 'axios';
import Validators from '../validators/validators'
import { Row, Col, Card, Table, Button, Badge, Modal, ModalBody, CustomInput, ModalHeader, Input, FormGroup, ModalFooter} from 'reactstrap';

class Stock extends Component {

    constructor(props) {
        super(props);
        this.state = {
            products: [],
            data : {
                labels: ["January", "February", "March"],
                datasets: [{
                label: ["My First dataset","ok"],
                backgroundColor: ["#a3c7c9","#889d9e","#647678"],
                data: [0, 10, 5],
                }]
            }
        
        }

        
        
    }

    componentDidMount() {
        axios.get(process.env.REACT_APP_API_URL+'/stock/getProduits',
        {
            headers : {
                'authtoken' : sessionStorage.getItem('token')
            }
        } )
            .then(res =>  {
                const products = res.data;
                this.setState({ products });
                this.showProducts();
                this.countCategories();
              });
        
        
    }

    showProducts() {

        let table = []

        if (Validators.isDefined(this.state.products.data)) {
            for (let i=0; i < Object.keys(this.state.products.data).length; i++) {
                let product = this.state.products.data[i];
                table.push(
                    <tr>
                        <th> {product.nom} </th>
                        <th> {product.categorieProduit} </th>
                        <th> {product.prixAchat} </th>
                        <th> {product.prixVente} </th>
                        <th> {product.disponible} </th>
                        <th> {product.quantite} </th>
                        
                    </tr>);
            }
        }
        
        
        return table;
    }

    
    countCategories() {
        let tmpName = ""
        let count = 0;

        let categories = []
        for (let i=0; i < Object.keys(this.state.products.data).length; i++) {
            console.error(this.state.products.data[3]);
            let product = this.state.products.data[i];
            
            if (tmpName == "")
                tmpName = this.state.products.data[0].categorieProduit;
                
            if (i == (Object.keys(this.state.products.data).length)-1) {
                count++;
                categories.push({"categorie" : product.categorieProduit, "nb" : count})    
            } else if (tmpName != product.categorieProduit) {
                categories.push({"categorie" : tmpName, "nb" : count});
                tmpName = product.categorieProduit;
                count = 1;
                
            } else {
                count++;
            }
            
        }

        console.log(categories);
    }
    // ----------------------- VUE HTML -----------------------------

    render() {
        
        return (
            <div>
                <Row>
                    <Col>
                        <h3>
                            Gestion des stocks
                        </h3>
                    </Col>
                </Row>
                <hr />
                <Row>
                    <Col lg="6">
                        <Card>
                        < Doughnut
          data={this.state.data}
          
          height={500}
          width={700}
          />
                        </Card>
                    </Col>
                </Row>
                <Row>
                    <Col lg="6">
                        <Card>
                            <Table className="TableUsers">
                                <thead>
                                <tr>
                                    <th>Nom du produit</th>
                                    <th>Catégorie de produit</th>
                                    <th>Prix d'achat</th>
                                    <th>Prix de vente</th>
                                    <th>Disponible</th>
                                    <th>Quantité</th>
                                </tr>
                                </thead>
                                <tbody>
                            
                                {this.showProducts()}
                                
                                </tbody>
                            </Table>
                        </Card>
                    </Col>
                    <Col lg="6">
                        <Card>
                            <Table className="TableUsers">
                                <thead>
                                <tr>
                                    <th>Nom du produit</th>
                                    <th>Catégorie de produit</th>
                                    <th>Prix d'achat</th>
                                    <th>Prix de vente</th>
                                    <th>Disponible</th>
                                </tr>
                                </thead>
                                <tbody>
                            
                                {this.showProducts()}
                                
                                </tbody>
                            </Table>
                        </Card>
                    </Col>
                </Row>

            </div>
        );
    }
}

export default Stock;