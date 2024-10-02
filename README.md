# Token Staking on Eclipse

## Requirements

1. Install **Rust** and **Cargo**:
   - Follow the instructions on the [Rust website](https://www.rust-lang.org/tools/install) to install Rust and Cargo.

2. Install **Anchor Framework** for developing and deploying on the **Solana Virtual Machine (SVM)**:
   - Run the following command to install:
     ```bash
     cargo install --git https://github.com/project-serum/anchor anchor-cli --locked
     ```

3. Install **Solana CLI**:
   - Follow the instructions on the [Solana website](https://docs.solana.com/cli/install-solana-cli-tools) to install Solana CLI.

4. Set up Solana CLI to work with **Eclipse**:
   ```bash
   solana config set --url https://rpc-url.eclipse.network
