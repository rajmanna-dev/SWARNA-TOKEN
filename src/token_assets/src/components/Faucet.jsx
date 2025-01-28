import React, { useState } from 'react';
import { token } from '../../../declarations/token';

function Faucet() {
  const [isDisable, setIsDisable] = useState(false);
  const [buttonText, setButtonText] = useState('Gimme gimme');

  async function handleClick(event) {
    setIsDisable(true);
    const result = await token.payOut();
    setButtonText(result);
  }

  return (
    <div className="blue window">
      <h2>
        <span role="img" aria-label="tap emoji">
          🚰
        </span>
        Faucet
      </h2>
      <label>
        Get your free DAngela tokens here! Claim 10,000 SWARNA coins to your
        account.
      </label>
      <p className="trade-buttons">
        <button id="btn-payout" onClick={handleClick} disabled={isDisable}>
          {buttonText}
        </button>
      </p>
    </div>
  );
}

export default Faucet;
