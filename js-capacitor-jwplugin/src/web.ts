import { WebPlugin } from '@capacitor/core';
import { JWPlayerPlugin } from './definitions';

declare global {
    interface Window { jwplayer: any; }
}

export class JWPlayerWeb extends WebPlugin implements JWPlayerPlugin {
  constructor() {
    super({
      name: 'JWPlayer',
      platforms: ['web'],
    });
  }

  async echo(options: { value: string }): Promise<{ value: string }> {
    console.log('ECHO', options);
    return options;
  }

  initPlayer(options: { containerId: string }) {
    let { containerId } = options;

    let jwPlayerScriptEl = document.createElement('script');
    jwPlayerScriptEl.src = 'https://cdn.jwplayer.com/libraries/PACl5H4K.js';

    jwPlayerScriptEl.onload = () => {
      window.jwplayer(containerId).setup({
        autostart: false,
        "playlist": [{
          "file": "http://media.w3.org/2010/05/sintel/trailer.mp4"
        }]
      });
    }

    document.body.appendChild(jwPlayerScriptEl)
  }
}

const JWPlayer = new JWPlayerWeb();

export { JWPlayer };

import { registerWebPlugin } from '@capacitor/core';
registerWebPlugin(JWPlayer);
