use starknet::ContractAddress;
#[derive(Model, Copy, Drop, Serde)]
struct Avatar{  
#[key] id:u32,
 creator: ContractAddress,   
 name: felt252,  
 alias: felt252,
 descriptionA: felt252,
 descriptionB: felt252,
 #[key] seedId: u32
}