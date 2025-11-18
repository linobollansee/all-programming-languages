// Pulumi (TypeScript)
import * as pulumi from "@pulumi/pulumi";

export const message = "Hello, World!";

export function greet(name: string): string {
    return `Hello, ${name}!`;
}
