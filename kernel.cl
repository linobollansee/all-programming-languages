// OpenCL
__kernel void hello(__global char* message) {
    int gid = get_global_id(0);
    message[gid] = message[gid] + 1;
}
