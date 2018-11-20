import React, { Component } from 'react';
import {Bar, Doughnut} from 'react-chartjs-2';

import dispo from "./img/checked.svg";
import notdispo from "./img/notchecked.svg";
import modify from '../newUser/img/edit.svg';
import deleteimg from '../newUser/img/rubbish-bin.svg';
import './Stock.css';
import axios from 'axios';
import Validators from '../validators/validators'
import { Row, Col, Card, Table, Button, Badge, Modal, ModalBody, CustomInput, ModalHeader, Input, FormGroup, ModalFooter} from 'reactstrap';

class Stock extends Component {

    constructor(props) {
        super(props);
        this.state = {
            products: [],
            dataDoughnut : {
            },
            optionDoughnut : {

            },
            dataBar : {
            },
            optionsBar : {

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
                this.showProductsBar("categorie")
              });
        
        
    }

    showProducts() {

        let table = []

        if (Validators.isDefined(this.state.products.data)) {
            for (let i=0; i < Object.keys(this.state.products.data).length; i++) {
                let product = this.state.products.data[i];
                let dispoimg = (product.disponible) ? <img src={dispo} /> : <img src={notdispo} />;
                table.push(
                    <tr>
                        <th> {product.nom} </th>
                        <th> {product.categorieProduit.nom} </th>
                        <th> {product.prixAchat} </th>
                        <th> {product.prixVente} </th>
                        <th> {dispoimg} </th>
                        <th> {product.quantite} </th>
                        <th> 
                            <Button color="warning"><img src={modify} /></Button>{' '}
                            <Button color="danger"><img src={deleteimg} /></Button>{' '}
                        </th>  
                    </tr>);
            }
        }
        
        
        return table;
    }

    showProductsBar(filter) {

        let produitsNom = [];
        let produitsQte = [];
        let colors = [];

        if (Validators.isDefined(this.state.products.data)) {
            for (let i=0; i < Object.keys(this.state.products.data).length; i++) {
                let product = this.state.products.data[i];
                if (product.categorieProduit.nom == filter) {
                    produitsNom.push(product.nom);
                    produitsQte.push(product.quantite);
                    colors.push('#'+(Math.random()*0xFFFFFF<<0).toString(16));
                }
            }
        }
        
        console.log(produitsNom, produitsQte);  
        this.setState({
            dataBar : {
                labels: produitsNom,
                datasets: [{
                    backgroundColor: colors,
                    data: produitsQte,
                }]
            },
            optionsBar: {
                legend: { display: false },
                title: {
                  display: true,
                  text: filter
                },
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
              }
        
        });

    }

    
    countCategories() {

        let categories = [];
        let colors = []
        let categorieList = []

        for (let i=0; i < Object.keys(this.state.products.data).length; i++) {
            
            let product = this.state.products.data[i];
            
            if (!categories.includes(product.categorieProduit.nom)) {
                categories.push(product.categorieProduit.nom);
                colors.push(product.categorieProduit.colorGraph);
                categorieList.push(<tr>
                    <th> {product.categorieProduit.nom} </th>
                    <th> {product.categorieProduit.colorGraph} </th>
                    <th> 
                        <Button color="warning"><img src={modify} /></Button>{' '}
                        <Button color="danger"><img src={deleteimg} /></Button>{' '}
                    </th>                 
                </tr>);
            }
                
        }

        let categorieStat = [];
        let donnees = [];
        

        for (let j = 0 ; j < categories.length; j++) {
                
            categorieStat.push({"categorie" : categories[j], "count" : 0});
        }

        
        for (let i=0; i < Object.keys(this.state.products.data).length; i++) {
            let product = this.state.products.data[i];

            for (let j = 0 ; j < categorieStat.length; j++) {
                
                if (categorieStat[j].categorie == product.categorieProduit.nom) {
                    categorieStat[j].count++;
                    donnees[j] =  categorieStat[j].count;

                }
            }
        
        }
        
        this.setState({
            dataDoughnut : {
                labels: categories,
                datasets: [{
                    label: ["My First dataset","ok"],
                    backgroundColor: colors,
                    data: donnees,
                }]
            },
            dataListCategories : categorieList
        
        }); 
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
                        < Bar
                            data={this.state.dataBar}
                            options= {this.state.optionsBar}
                            height={500}
                            width={800}
                        />
                        </Card>
                    </Col>
                    <Col lg="6">
                        <Card>
                        < Doughnut
                            data={this.state.dataDoughnut}
                            options= {this.state.optionDoughnut}
                            height={500}
                            width={800}
                        />
                        </Card>
                    </Col>
                    
                </Row>
                <Row>
                    <Col lg="6">
                        <Card>
                        <h5> Liste des produits </h5>
                        
                            <Table className="TableUsers">
                                
                                <thead>
                                
                                <tr>
                                    <th>Nom du produit</th>
                                    <th>Catégorie de produit</th>
                                    <th>Prix d'achat</th>
                                    <th>Prix de vente</th>
                                    <th>Disponible</th>
                                    <th>Quantité</th>
                                    <th>Actions</th>
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
                        <h5> Liste des catégories </h5>
                        
                            <Table className="TableUsers">
                                
                                <thead>
                                
                                <tr>
                                    <th>Nom catégorie</th>
                                    <th>Couleur catégorie</th>
                                    <th>Actionst</th>
                                </tr>
                                </thead>
                                <tbody>
                            
                                {this.state.dataListCategories}
                                
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