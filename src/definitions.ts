// @ts-ignore
declare module "@capacitor/core" {
  interface PluginRegistry {
    AppAvailability: AppAvailabilityPlugin;
  }
}

export interface AppAvailabilityPlugin {
  check(sheme: string): Promise<{ value: boolean }>;
  open(sheme: string): Promise<void>;
}
