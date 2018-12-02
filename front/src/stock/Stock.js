import React, { Component } from 'react';
import {Bar, Doughnut} from 'react-chartjs-2';

import dispo from "./img/checked.svg";
import notdispo from "./img/notchecked.svg";
import modify from '../newUser/img/edit.svg';
import plus from '../newUser/img/add.svg';
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
            productsView : [],
            dataDoughnut : {},
            optionDoughnut : {},
            dataBar : {},
            optionsBar : {},
            categoriesSelect : [],
            modalNewProduct: false,
            modalEditProduct: false,
            modalDeleteProduct: false,
            currentProduct : {},

            nomProduit : "",
            prixAchat : "",
            prixVente : "",
            quantite : "",
            disponible : "",
            
        
        }

        this.createProduit = this.createProduit.bind(this);
        this.changeCategorieProduct = this.changeCategorieProduct.bind(this);
        this.changeShowProducts = this.changeShowProducts.bind(this);
        
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
                this.setState({ products : products });
                this.showProducts();
                this.countCategories();
                this.showProductsBar("Alimentaire");
              });
        
        
    }



    showProducts(filter) {

        
        let table = []
    
        if (Validators.isDefined(this.state.products.data)) {
            
            for (let i=0; i < Object.keys(this.state.products.data).length; i++) {
                let product = this.state.products.data[i];
                let dispoimg = (product.disponible) ? <img src={dispo} /> : <img src={notdispo} />;

                if (!Validators.isDefined(filter) || filter == "") {
                    table.push(
                        <tr>
                            <td> {product.nom} </td>
                            <td> <span style={{backgroundColor: product.categorieProduit.colorGraph}} className="CategorieProduct">{product.categorieProduit.nom}</span> </td>
                            <td> {product.prixAchat} </td>
                            <td> {product.prixVente} </td>
                            <td> {dispoimg} </td>
                            <td> {product.quantite} </td>
                            <td> 
                                <Button color="warning" onClick={this.showModal.bind(this, 'modalEditProduct', product)}><img src={modify} /></Button>{' '}
                                <Button color="danger" onClick={this.showModal.bind(this, 'modalDeleteProduct', product)}><img src={deleteimg} /></Button>{' '}
                            </td>  
                        </tr>);
                } else if (product.nom.toLowerCase().indexOf(filter.toLowerCase()) !== -1) {
                    table.push(
                        <tr>
                            <td> {product.nom} </td>
                            <td> <span style={{backgroundColor: product.categorieProduit.colorGraph}} className="CategorieProduct">{product.categorieProduit.nom}</span> </td>
                            <td> {product.prixAchat} </td>
                            <td> {product.prixVente} </td>
                            <td> {dispoimg} </td>
                            <td> {product.quantite} </td>
                            <td> 
                                <Button color="warning"><img src={modify} /></Button>{' '}
                                <Button color="danger"><img src={deleteimg} /></Button>{' '}
                            </td>  
                        </tr>);
                    
                }
                
                
            }
        }
        
        
        this.setState({ productsView : table });
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
                            beginAtZero: true,
                            stepSize: 1
                        }
                    }]
                }
              }
        
        });

    }

    getValues(event, field) {
        this.setState({
          [field]: event.target.value
        });
        console.log(this.state);
    }

    closeModal(tabId) {
        this.setState({
            [tabId]: false
        });
    }

    showModal(modal, product) {
        this.setState({
            [modal]: true,
            "currentProduct" : product
        });
    }

    changeCategorieProduct(event) {
        this.showProductsBar(event.target.value);
    }

    changeShowProducts(event) {
        this.showProducts(event.target.value);
    }

    createProduit() {
        let fields = {
            "nomProduit" : this.state.nomProduit,
            "categorieProduit" : this.state.categorieProduit,
            "prixAchat" : this.state.prixAchat,
            "prixVente" : this.state.prixVente,
            "quantite" : this.state.quantite,
            "disponible" : this.state.disponible
        }
        
        let inputs = document.querySelectorAll('inputNewProduct');
        for (let index = 0; index < inputs.length; ++index) {
            inputs[index].classList.remove("error-input");
        }

        console.log(isValid);
 
        let isValid = Validators.fields_not_empty(fields);

        if (isValid === true) {
            axios.post(process.env.REACT_APP_API_URL+'/stock/newProduit', 
                {
                    "nomProduit" : this.state.nomProduit,
                    "categorieProduit" : this.state.categorieProduit,
                    "prixAchat" : this.state.prixAchat,
                    "prixVente" : this.state.prixVente,
                    "quantite" : this.state.quantite,
                    "disponible" : this.state.disponible
                },
                {
                    headers : {
                        'Content-Type': 'application/x-www-form-urlencoded',
                        'authtoken' : sessionStorage.getItem('token')
                    }
                } 
                )
                .then(r => {
                    this.closeModal("modalNewUser");
                    // A changer si possible, mauvaise méthode..
                    //eslint-disable-next-line
                    window.location.reload();
                })
                .catch((r) => {alert("Le produit est déjà existant")});
            
        } else {
            for (var key in isValid) {
                key.classList.add("error-input");
            }
        }
    }
    
    countCategories() {
        let categoriesSelect = []
        let categories = []
        let colors = []
        let categorieList = []

        for (let i=0; i < Object.keys(this.state.products.data).length; i++) {
            
            let product = this.state.products.data[i];
            
            if (!categories.includes(product.categorieProduit.nom)) {

                categories.push(product.categorieProduit.nom);
                colors.push(product.categorieProduit.colorGraph);
                categorieList.push(<tr>
                    <td> {product.categorieProduit.nom} </td>
                    <td> {product.categorieProduit.colorGraph} </td>
                    <td> 
                        <Button color="warning"><img src={modify} /></Button>{' '}
                        <Button color="danger"><img src={deleteimg} /></Button>{' '}
                    </td>                 
                </tr>);
                categoriesSelect.push(
                    <option>{product.categorieProduit.nom}</option>
                );
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
            dataListCategories : categorieList,
            categoriesSelect : categoriesSelect
        
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
                        
                        <Input type="select" onChange={this.changeCategorieProduct} bsSize="sm" className="CategorieSize">
                            {this.state.categoriesSelect}
                        </Input>
                        
                        < Bar
                            data={this.state.dataBar}
                            options= {this.state.optionsBar}
                            height={500}
                            width={800}
                        />
                        
                    </Col>
                    <Col lg="6">
                        < Doughnut
                            data={this.state.dataDoughnut}
                            options= {this.state.optionDoughnut}
                            height={500}
                            width={800}
                        />
                    </Col>
                    
                </Row>
                <hr />
                <Row>
                    <Col lg="8">
                        <h5> Liste des produits </h5>
                            <Button color="success"  onClick={this.showModal.bind(this, 'modalNewProduct')}><img src={plus} className="NewUser"/> Nouveau produit</Button>{' '}
                            <Table className="Table">
                                
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
                                <tr>
                                    <td><Input onChange={this.changeShowProducts} placeholder="Rechercher un produit"/></td>
                                </tr>
                                {this.state.productsView}
                                
                                </tbody>
                            </Table>
                    </Col>
                    
                    <Col lg="4">
                        <h5> Liste des catégories </h5>
                            <Button color="success"><img src={plus} className="NewUser"/> Nouvelle catégorie produit</Button>{' '}
                            <Table className="Table">
                                
                                <thead>
                                
                                <tr>
                                    <th>Nom catégorie</th>
                                    <th>Couleur catégorie</th>
                                    <th>Actions</th>
                                </tr>
                                </thead>
                                <tbody>
                            
                                {this.state.dataListCategories}
                                
                                </tbody>
                            </Table>
                    </Col>
                </Row>



                <Modal isOpen={this.state.modalNewProduct} toggle={this.closeModal.bind(this, 'modalNewProduct')}>
                    <ModalHeader toggle={this.closeModal.bind(this, 'modalNewProduct')}>
                            Nouveau produit
                    </ModalHeader>
                    <ModalBody>
                        <FormGroup>
                            <label>Nom du produit</label>
                            <Input onChange={evt => this.getValues(evt, 'nomProduit')} placeholder="Nom du produit" className="inputNewProduct"/>
                        </FormGroup>
                        
                        <FormGroup>
                            <label>Catégorie de produit</label>
                            <Input type="select" onChange={evt => this.getValues(evt, 'categorieProduit')} bsSize="sm" className="inputNewProduct">
                                {this.state.categoriesSelect}
                            </Input>
                        </FormGroup>
                        <FormGroup>
                            <label>Prix d'achat</label>
                            <Input type="number" onChange={evt => this.getValues(evt, 'prixAchat')} placeholder="Prix d'achat" className="inputNewProduct"/>
                        </FormGroup>
                        <FormGroup>
                            <label>Prix de vente</label>
                            <Input type="number" onChange={evt => this.getValues(evt, 'prixVente')}placeholder="Prix de vente"  className="inputNewProduct"/>
                        </FormGroup>
                        <FormGroup>
                            <label>Quantité</label>
                            <Input type="number"onChange={evt => this.getValues(evt, 'quantite')}  placeholder="Quantité" className="inputNewProduct"/>
                        </FormGroup>
                        <FormGroup>
                            <label>Disponible</label>
                            <div onChange={evt => this.getValues(evt, 'disponible')}>
                                <input type="radio" value="True" name="disponible"/> <img src={notdispo}  className="SmallImg"/>
                                <input type="radio" value="False" name="disponible"/> <img src={dispo} className="SmallImg" /> 
                            </div>
                        </FormGroup>
                        
                        <ModalFooter>
                            <Button color="success" className="SubmitButton" onClick={this.createProduit}>Création</Button>
                            <Button color="warning" className="SubmitButton" onClick={this.closeModal.bind(this, 'modalNewProduct')}>Annuler</Button>
                        </ModalFooter>
                    </ModalBody>
                </Modal>

                <Modal isOpen={this.state.modalEditProduct} toggle={this.closeModal.bind(this, 'modalEditProduct')}>
                    <ModalHeader toggle={this.closeModal.bind(this, 'modalEditProduct')}>
                            Éditer le produit <b>{this.state.currentProduct.nom}</b>
                    </ModalHeader>
                    <ModalBody>
                        <FormGroup>
                            <label>Nom du produit</label>
                            <Input onChange={evt => this.getValues(evt, 'nomProduit')} value={this.state.currentProduct.nom} placeholder="Nom du produit"/>
                        </FormGroup>
                        
                        <FormGroup>
                            <label>Catégorie de produit</label>
                            <Input type="select" onChange={evt => this.getValues(evt, 'categorieProduit')} bsSize="sm">
                                {this.state.categoriesSelect}
                            </Input>
                        </FormGroup>
                        <FormGroup>
                            <label>Prix d'achat</label>
                            <Input type="number" placeholder="Prix d'achat" value={this.state.currentProduct.prixAchat}/>
                        </FormGroup>
                        <FormGroup>
                            <label>Prix de vente</label>
                            <Input type="number" placeholder="Prix de vente" value={this.state.currentProduct.prixVente}/>
                        </FormGroup>
                        <FormGroup>
                            <label>Quantité</label>
                            <Input type="number" placeholder="Quantité" value={this.state.currentProduct.quantite}/>
                        </FormGroup>
                        <FormGroup>
                            <label></label>
                            <Input onChange={evt => this.getValues(evt, 'nomProduit')} value={this.state.currentProduct.nom} placeholder="Nom du produit"/>
                        </FormGroup>
                        
                        <ModalFooter>
                            <Button color="success" className="SubmitButton" >Modifier</Button>
                            <Button color="warning" className="SubmitButton" onClick={this.closeModal.bind(this, 'modalEditProduct')}>Annuler</Button>
                        </ModalFooter>
                    </ModalBody>
                </Modal>


                <Modal isOpen={this.state.modalDeleteProduct} toggle={this.closeModal.bind(this, 'modalDeleteProduct')}>
                    <ModalHeader toggle={this.closeModal.bind(this, 'modalDeleteProduct')}>
                        Suppression d'un produit
                    </ModalHeader>
                    <ModalBody>
                        Êtes-vous sur de supprimer l'utilisateur <b> {this.state.currentProduct.nom} </b> ?
                    </ModalBody>
                    <ModalFooter>
                        <Button color="danger" className="SubmitButton" >Supprimer</Button>
                        <Button color="warning" className="SubmitButton" onClick={this.closeModal.bind(this, 'modalDeleteProduct')}>Annuler</Button>
                    </ModalFooter>
                    
                </Modal>
            </div>
        );
    }
}

export default Stock;