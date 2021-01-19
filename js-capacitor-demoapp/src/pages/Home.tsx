import { IonContent, IonHeader, IonPage, IonTitle, IonToolbar } from '@ionic/react';
import React from 'react';
import ExploreContainer from '../components/ExploreContainer';
import './Home.css';
import { Plugins } from '@capacitor/core';

const Home: React.FC = () => {

  const { JWPlayer } = Plugins;
  console.log('Calling Android plugin');
  JWPlayer.test();

  return (
    <IonPage>
      <IonHeader>
        <IonToolbar>
          <IonTitle>Video Demo</IonTitle>
        </IonToolbar>
      </IonHeader>
      <IonContent fullscreen>
        <IonHeader collapse="condense">
          <IonToolbar>
            <IonTitle size="large">Video DEMO</IonTitle>
          </IonToolbar>
        </IonHeader>
        <ExploreContainer />
      </IonContent>
    </IonPage>
  );
};

export default Home;
