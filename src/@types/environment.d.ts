declare global {
  namespace NodeJS {
    interface ProcessEnv {
      WYZE_USERNAME: string;

      WYZE_PASSWORD: string;

      /**
       * SmartThings Token
       */
      ST_TOKEN: string;

      HOST: string;

      PORT: string;

      LOG_MODE?: 'DEBUG' | 'INFO' | 'WARN' | 'ERROR';

      NODE_ENV: 'development' | 'production';

      POWER_AUTH: string;
    }
  }
}

// If this file has no import/export statements (i.e. is a script)
// convert it into a module by adding an empty export statement.
export {};
