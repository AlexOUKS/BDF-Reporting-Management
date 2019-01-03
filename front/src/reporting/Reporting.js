import React, { Component } from 'react';
import NewUser from '../newUser/NewUser';
import Stock from '../stock/Stock';
import axios from 'axios';
import { Row, Col, Card, Table, Button, Badge, Modal, ModalBody, CustomInput, ModalHeader, Input, FormGroup, ModalFooter} from 'reactstrap';

import Validators from "../validators/validators";
import {Bar, Doughnut} from 'react-chartjs-2';





class Reporting extends Component {

    constructor(props) {
        super(props);
        this.state = {
            dataDoughnut : {},
            optionDoughnut : {},
            venteTemp : []}


        this.requestDataFromDate = this.requestDataFromDate.bind(this);
        this.findPercentageProduct = this.findPercentageProduct.bind(this);


        };



    requestDataFromDate(){

        var debut = document.getElementById("DateDebut");
        var fin = document.getElementById("DateFin");
        console.log(debut.value);
        console.log(fin.value);
        axios.post(process.env.REACT_APP_API_URL+'/ventes/getVenteDF',

            {
                "DateDebut" : debut.value,
                "DateFin" : fin.value
            },

            ).then(res => {
                    const venteTemp = res.data;


                    this.setState(
                        {venteTemp
                    });
                    console.log(this.state.venteTemp);

                    let A = this.findPercentageProduct(this.state.venteTemp);

                    let dataPercentage = [];
                    let dataName = [];
                    let colors = [];

                    for (let j = 0 ; j < A.length; j++) {
                        dataPercentage.push(Math.round(A[j].occurence));
                        dataName.push(A[j].nom);
                        colors.push('#'+(Math.random()*0xFFFFFF<<0).toString(16));
                    }

                    let top5Products = [];
                    let produitsNom = [];
                    let produitsQte = []
                    let produitsColor = [];

                    top5Products = A.slice(0).sort(function(a,b){return  a.nombre - b.nombre});   
                    top5Products = top5Products.reverse();
                    
                    for (let i = 0; i < 5 ; i++) {
                        if (Validators.isDefined(top5Products[i])) {
                            produitsNom.push(top5Products[i].nom);
                            produitsQte.push(top5Products[i].nombre);
                            produitsColor.push('#'+(Math.random()*0xFFFFFF<<0).toString(16));
                        }
                    }

                    console.log(produitsNom,produitsQte,produitsColor)

                    this.setState({
                        dataBar : {
                            labels: produitsNom,
                            datasets: [{
                                backgroundColor: produitsColor,
                                data: produitsQte,
                            }]
                        },
                        optionsBar: {
                            legend: { display: false },
                            scales: {
                                yAxes: [{
                                    ticks: {
                                        beginAtZero: true,
                                    }
                                }],
                                xAxes: [{
                                    stacked: false,
                                    ticks: {
                                        autoSkip: false
                                    }
                                }]
                            }
                          },
                        dataDoughnut: {
                            datasets: [{   
                                backgroundColor: colors,
                                data :dataPercentage
                            }],
                            labels: dataName
                        }, 
                        optionDoughnut : {
                            animation :{animateRotate : true},
                            legend: {
                                display: false
                             },
                        }
                    });
                    console.log(A);







      })


    }

    findPercentageProduct(list){

        let tempArray = [];
        var countProduct = list.length;


        for (let j = 0 ; j < countProduct; j++) {
            let Produit = list[j];


            if( !this.tupleFind(tempArray, Produit)){
 
                let occurence = 0;

                for (let i = 0 ; i < countProduct; i++) {

                    if (list[i].produit == Produit.produit) {
                        occurence = occurence + list[i].quantité;

                    }
                }
                
                const tuple = {nom : Produit.produit, occurence : (occurence/countProduct)*100, nombre : occurence};
                tempArray.push(tuple);
            }
            else{

            }

        }
        let totalOccurence = 0;
        for (let k = 0 ; k < tempArray.length; k++) {
            totalOccurence += tempArray[k].occurence;
        }

        return tempArray;
    }

    tupleFind(array, object){
        var countProduct = array.length;
       for (let j = 0 ; j < countProduct; j++) {
            let tuple = array[j];
            if (tuple.nom == object.produit){

                return true
            }
       }

       return false

    }






    // ----------------------- VUE HTML -----------------------------

    render() {
        return (
            <div>
                <Row>
                    <Col>
                    <h3>
                        Reporting des ventes
                    </h3>
                    </Col>
                </Row>
                <hr />
                <Row>
                    
                    <Col lg="2">
                    <h5> Date de filtrage </h5>
                    De
                    <Input type={"date"} id={"DateDebut"}></Input>
                    à 
                    <Input type={"date"} id={"DateFin"}></Input>
                    </Col>  
                    
                    <Button onClick={this.requestDataFromDate}>Valider</Button>
                </Row>
                <hr />
                <Row>
                    
                    <Col lg="6">
                        <h5> Digramme des ventes totales</h5>
                        < Doughnut
                                data={this.state.dataDoughnut}
                                options= {this.state.optionDoughnut}
                                height={500}
                                width={800}
                        />
                    </Col>
                    <Col lg="6">
                         <h5> Top 5 des meilleures ventes</h5>
                        < Bar
                                data={this.state.dataBar}
                                options= {this.state.optionsBar}
                                height={500}
                                width={800}
                            />
                    </Col>
                    {/*<select>
                        <option>Mois</option>
                        <option>année</option>
                    </select> */}
                </Row>
                

            </div>


        )
    }

}

export default Reporting;
