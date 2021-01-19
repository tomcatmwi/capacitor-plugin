declare module '@capacitor/core' {
  interface PluginRegistry {
    JWPlayer: JWPlayerPlugin;
  }
}

export interface JWPlayerPlugin {
  echo(options: { value: string }): Promise<{ value: string }>;
  initPlayer(options: { containerId: string }): void;
}
