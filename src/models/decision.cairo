use starknet::ContractAddress;

#[derive(Model, Copy, Drop, Serde)]
struct Decision{  
#[key]assistantId: felt252,
player: ContractAddress,
#[key]counter: felt252,
#[key]threadId: felt252,
runId: felt252,
cidA: felt252,
cidB: felt252
}