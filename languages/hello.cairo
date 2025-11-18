// Cairo (StarkNet smart contract)
%lang starknet

from starkware.cairo.common.cairo_builtins import HashBuiltin

@view
func say_hello{syscall_ptr: felt*, pedersen_ptr: HashBuiltin*, range_check_ptr}() -> (message: felt) {
    return (message=123456);
}
