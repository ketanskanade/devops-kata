import logo from './logo.svg';
import './App.css';
import {useEffect, useState} from "react";
import axios from "axios";

function App() {
  const [data, setData] = useState()

  useEffect(() => {
    (async () => {
      try {
        const response = await axios.get('http://localhost:3001/quote');
        setData(response.data[0])
      } catch (error) {
        console.error(error);
      }
    })();
  }, []);

  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        {data &&
          <p>{data.quote} <i><sub>{data.movie} [{data.year}]</sub></i></p>
        }
      </header>
    </div>
  );
}

export default App;
