import React, { Component } from 'react';
import reporting from './img/increasing-stocks-graphic.svg';
import stock from './img/box.svg';
import logo from '../img/logo-couleur.png';
import './Menu.css';

class Menu extends Component {
 // ----------------------- VUE HTML -----------------------------

  render() {
    return (
      <div className="MenuNav">
            <div className="BlockLogo">
                <img className="ImgLogo" src={logo} />
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
            </ul>
      </div>
    )
  }

}

export default Menu;