import React, { Component } from 'react';
import NewUser from '../newUser/NewUser';
import reporting from './img/increasing-stocks-graphic.svg';
import user from './img/user.svg';
import stock from './img/box.svg';
import logo from '../img/logo-couleur.png';

import './Menu.css';

class Menu extends Component {

    constructor(props) {
        super(props);
        this.state = {
            display: <img src={logo} width="500px" />
        };

        
    
    }

    display(menu) {
        switch (menu) {
            case "ventes":
                
            break;
            case "ventes":
                
            break;
            case "stocks":

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
                            <li onClick={this.display.bind(this,"ventes")}>
                                <img src={reporting} />
                                <span> Reporting des ventes </span>
                            </li>
                            <li onClick={this.display.bind(this,"stocks")}>
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