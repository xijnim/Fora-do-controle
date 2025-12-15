function assert(value, message="ASSERTION FAILED") {
    if !value {
        show_error(message, true);
    }
}

function assert_exists(value, message="ASSERTION FAILED: UNDEFINED") {
    if is_undefined(value) {
        show_error(message, true);
    }
}

function assert_ne(a, b) {
    if a == b {
        show_error($"ASSERTION FAILED\n{a} == {b}", true);
    }
}

function assert_eq(a, b, message) {
    if a != b {
        show_error($"ASSERTION FAILED\n{a} != {b}", true);
    }
}
