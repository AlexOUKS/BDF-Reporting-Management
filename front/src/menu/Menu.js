import React, { Component } from 'react';
import NewUser from '../newUser/NewUser';
import Stock from '../stock/Stock';
import Vente from '../vente/Vente';
import reporting from './img/increasing-stocks-graphic.svg';
import user from './img/user.svg';
import stock from './img/box.svg';
import logo from '../img/logo-couleur.png';



import './Menu.css';

class Menu extends Component {

    constructor(props) {
        super(props);
        this.handler = this.handler.bind(this);
        this.state = {
            display: <img src={logo} width="500px" />
        };

        
    
    }

    handler() {
        this.setState({display : <Vente />});
    }

    display(menu) {
        switch (menu) {
            case "vente":
                this.setState({display : <Vente />});
            break;
            case "stock":
                this.setState({display : <Stock action={this.handler} />});
            break;
            case "user":
                this.setState({display : <NewUser />});
            break;

            default:
                break;
        }
    }


    
    // ----------------------- VUE HTML -----------------------------

    render() {
        return (
            <div className="Page"> 
                <div className="MenuNav">
                        <div className="BlockLogo">
                            <img className="ImgLogo2" src={logo} />
                        </div>
                        <ul className="MenuList">
                            <li onClick={this.display.bind(this,"vente")}>
                                <img src={reporting} />
                                <span> Reporting des ventes </span>
                            </li>
                            <li onClick={this.display.bind(this,"stock")}>
                                <img src={stock} />
                                <span> Gestion des stocks </span>
                            </li>
                            <li className="CreationCompte" onClick={this.display.bind(this,"user")}>
                                <img src={user} />
                                <a><span> Gestion utilisateurs </span></a>
                            </li>
                        </ul>
                </div>
                <div id="MainBlock">
                    <div className="MainBlockInner">
                        <div className="MainContent">
                            {
                                this.state.display
                            }
                        </div>
                    </div>
                </div>
            </div>
        )
    }

}

export default Menu;