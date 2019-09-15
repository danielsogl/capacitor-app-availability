// @ts-ignore
declare module '@capacitor/core' {
  interface PluginRegistry {
    AppAvailability: AppAvailabilityPlugin;
  }
}

export interface AppAvailabilityPlugin {
  check(options: { sheme: string }): Promise<{ value: boolean }>;
  open(options: { sheme: string }): Promise<void>;
}
