#!/usr/bin/env bash
function __sdkman_post_installation_hook {
    mv "$binary_input" "$zip_output"
}