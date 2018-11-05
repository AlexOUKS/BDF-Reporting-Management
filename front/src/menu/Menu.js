import React, { Component } from 'react';
import NewUser from '../newUser/NewUser';
import reporting from './img/increasing-stocks-graphic.svg';
import user from './img/user.svg';
import stock from './img/box.svg';
import logo from '../img/logo-couleur.png';

import './Menu.css';

class Menu extends Component {


    
    // ----------------------- VUE HTML -----------------------------

    render() {
        let display = "";
        if (display == "") {
            display = <NewUser />;
        }
        return (
            <div className="Page"> 
                <div className="MenuNav">
                        <div className="BlockLogo">
                            <img className="ImgLogo2" src={logo} />
                        </div>
                        <ul className="MenuList">
                            <li>
                                <img src={reporting} />
                                <span> Reporting des ventes </span>
                            </li>
                            <li>
                                <img src={stock} />
                                <span> Gestion des stocks </span>
                            </li>
                            <li className="CreationCompte">
                                <img src={user} />
                                <a><span> Gestion utilisateurs </span></a>
                            </li>
                        </ul>
                </div>
                <div id="MainBlock">
                    <div className="MainBlockInner">
                        <div className="MainContent">
                            {
                                display
                            }
                        </div>
                    </div>
                </div>
            </div>
        )
    }

}

export default Menu;