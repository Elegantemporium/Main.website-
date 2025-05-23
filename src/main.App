import React, { useState } from 'react';
import { FaWhatsapp, FaInstagram, FaShoppingCart } from 'react-icons/fa';
import './App.css';

const products = [
  { 
    id: 1, 
    name: 'Classic Leather Watch', 
    price: 499, 
    originalPrice: 600,
    image: '/attached_assets/DW001001101.jpg'
  },
  { 
    id: 2, 
    name: 'Simple Keychain', 
    price: 300,
    image: '/attached_assets/luxury-leather-keychain-simple-395.jpeg'
  },
  { 
    id: 3, 
    name: 'Decorative Stars Vase', 
    price: 399,
    originalPrice: 499,
    image: '/attached_assets/AFP-000251007-1000.png'
  },
];

export default function App() {
  const [cart, setCart] = useState([]);
  const [showCart, setShowCart] = useState(false);

  const addToCart = (product) => {
    setCart([...cart, product]);
  };

  const removeFromCart = (productId) => {
    setCart(cart.filter(item => item.id !== productId));
  };

  return (
    <div className="app">
      <header>
        <h1>Elegant Emporium</h1>
        <div className="social-links">
          <a href="https://wa.me/923484758378" target="_blank" rel="noopener noreferrer">
            <FaWhatsapp /> WhatsApp
          </a>
          <a href="https://instagram.com/ElegantEmporium" target="_blank" rel="noopener noreferrer">
            <FaInstagram /> Instagram
          </a>
          <button className="cart-button" onClick={() => setShowCart(!showCart)}>
            <FaShoppingCart /> ({cart.length})
          </button>
        </div>
      </header>

      <main>
        <div className="products">
          {products.map(product => (
            <div key={product.id} className="product-card">
              <img src={product.image} alt={product.name} />
              <h3><strong>{product.name}</strong></h3>
              {product.originalPrice ? (
                <div>
                  <p style={{textDecoration: 'line-through', color: '#666'}}>PKR {product.originalPrice}</p>
                  <p style={{color: '#28a745'}}>PKR {product.price} <span style={{color: '#dc3545'}}>15% OFF</span></p>
                </div>
              ) : (
                <p>PKR {product.price}</p>
              )}
              <button onClick={() => addToCart(product)}>Add to Cart</button>
            </div>
          ))}
        </div>

        {showCart && (
          <div className="cart">
            <h2>Shopping Cart</h2>
            {cart.map(item => (
              <div key={item.id} className="cart-item">
                <img src={item.image} alt={item.name} />
                <div>
                  <h3>{item.name}</h3>
                  <p>PKR {item.price}</p>
                </div>
                <button onClick={() => removeFromCart(item.id)}>Remove</button>
              </div>
            ))}
            <div className="cart-total">
              <h3>Total: PKR {cart.reduce((sum, item) => sum + item.price, 0)}</h3>
              <button onClick={() => window.location.href = 'https://wa.me/923484758378'}>
                Checkout via WhatsApp
              </button>
            </div>
          </div>
        )}
      </main>
    </div>
  );
}
