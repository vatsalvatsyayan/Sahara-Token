import React, { Component } from 'react'
import Identicon from 'identicon.js';
import './Navbar.css';

class Navbar extends Component {

  render() {
    return (
      <nav class="navbar">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">
                <img class="img-responsive" src={ require('./sahara.PNG') }
                className="ml-2"
                width='150'
                height='75'/>

            </a> 
        </div>

        <p class="navbar-text navbar-right" id="CryptoPredict"><a href="#" class="navbar-link">Predict Crypto Price</a></p>
        <p class="navbar-text navbar-right" id="ExchangePlatform"><a href="#" class="navbar-link">ICO Sale</a></p>

        

    </nav>
      

    );
  }
}

export default Navbar;
