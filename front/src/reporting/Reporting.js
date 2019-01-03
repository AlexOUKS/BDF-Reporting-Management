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
                    for (let j = 0 ; j < A.length; j++) {
                        dataPercentage.push(A[j].occurence);
                        dataName.push(A[j].nom)
                    }
                    console.log(dataPercentage)
                    this.setState({
                        dataDoughnut: {datasets: [
                                {
                                    data :dataPercentage
                                    ,label: ["My First dataset","ok"]
                                }
                            ] ,
                        labels: dataName}

                    , optionDoughnut : {animation :{animateRotate : true}}});
                    console.log(A);







      })


    }

    findPercentageProduct(list){

        let tempArray = [];
        var countProduct = list.length;


        for (let j = 0 ; j < countProduct; j++) {
            let Produit = list[j];


            if( !this.tupleFind(tempArray, Produit)){
                console.log(Produit.produit);
                let occurence = 0;

                for (let i = 0 ; i < countProduct; i++) {

                    if (list[i].produit == Produit.produit) {
                        occurence = occurence + list[i].quantité;

                    }
                }
                console.log(Produit.quantité);
                console.log(occurence);
                const tuple = {nom : Produit.produit, occurence : (occurence/countProduct)*100};
                tempArray.push(tuple);
            }
            else{

            }

        }
        let totalOccurence = 0;
        for (let k = 0 ; k < tempArray.length; k++) {
            totalOccurence += tempArray[k].occurence;
        }
        console.log(totalOccurence);
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
                < Doughnut
                        data={this.state.dataDoughnut}
                        options= {this.state.optionDoughnut}
                        height={500}
                        width={800}
                />
                {/*<select>
                    <option>Mois</option>
                    <option>année</option>
                </select> */}

                <p> De </p>
                <input type={"date"} id={"DateDebut"}></input>
                <p> à </p>
                <input type={"date"} id={"DateFin"}></input>
                <button onClick={this.requestDataFromDate}>validé</button>


            </div>


        )
    }

}

export default Reporting;
