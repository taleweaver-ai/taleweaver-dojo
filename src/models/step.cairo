use starknet::ContractAddress;

#[derive(Model, Copy, Drop, Serde)]
struct Step{  
#[key]assistantId: felt252,
player: ContractAddress,
#[key]counter: felt252,
#[key]threadId: felt252,
decisionA: felt252,
decisionB: felt252,
imageA: felt252,
imageB: felt252,
consequenceA : felt252,
consequenceB : felt252
}