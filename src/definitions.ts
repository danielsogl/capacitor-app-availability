// @ts-ignore
declare module "@capacitor/core" {
  interface PluginRegistry {
    AppAvailability: AppAvailabilityPlugin;
  }
}

export interface AppAvailabilityPlugin {
  echo(options: { value: string }): Promise<{value: string}>;
}
