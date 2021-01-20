import React, { useEffect } from 'react';
import './ExploreContainer.css';
import { Plugins } from '@capacitor/core';

interface ContainerProps { }

const ExploreContainer: React.FC<ContainerProps> = () => {
  const { JWPlayer } = Plugins;

  useEffect(() => {
    console.log('Calling Android plugin');
    console.log(JWPlayer.echo('Hey there'));
    // JWPlayer.test();

    console.log('jwplayer', JWPlayer.initPlayer);
    JWPlayer.initPlayer({ containerId: 'video' })
  }, [JWPlayer])

  return (
    <div className="container">
      <div id="video"></div>
    </div>
  );
};

export default ExploreContainer;
