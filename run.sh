dfx start --clean --background
dfx deploy
dfx canister call benchmark go "()"
dfx stop
