return {
  cmd = {
    "jdtls",
    "--jvm-arg="
      .."-javaagent:"
      .. require("mason-registry").get_package("jdtls"):get_install_path() .. "/lombok.jar"
  },
}
