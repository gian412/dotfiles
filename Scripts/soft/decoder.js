const _parse = paramString => paramString
    .replace(/%0A/gu, "\n")
    .replace(/%0D/gu, "\n")
    .replace(/%0A%0D/gu, "\n")
    .replace(/%20/gu, " ")
    .replace(/%21/gu, "!")
    .replace(/%22/gu, '"')
    .replace(/%23/gu, "#")
    .replace(/%24/gu, "$")
    .replace(/%25/gu, "%")
    .replace(/%26/gu, "&")
    .replace(/%27/gu, "'")
    .replace(/%28/gu, "(")
    .replace(/%29/gu, ")")
    .replace(/%2A/gu, "*")
    .replace(/%2B/gu, "+")
    .replace(/%2C/gu, ",")
    .replace(/%2D/gu, "-")
    .replace(/%2E/gu, ".")
    .replace(/%2F/gu, "/")
    .replace(/%3A/gu, ":")
    .replace(/%3B/gu, ";")
    .replace(/%3C/gu, "<")
    .replace(/%3D/gu, "=")
    .replace(/%3E/gu, ">")
    .replace(/%3F/gu, "?")
    .replace(/%40/gu, "@")
    .replace(/%5B/gu, "[")
    .replace(/%5C/gu, "\\")
    .replace(/%5D/gu, "]")
    .replace(/%5E/gu, "^")
    .replace(/%5F/gu, "_")
    .replace(/%60/gu, "`")
    .replace(/%7B/gu, "{")
    .replace(/%7C/gu, "|")
    .replace(/%7D/gu, "}")
    .replace(/%7E/gu, "~")
    .split("&");


const _decode = url => {
    const list = _parse(url);
    console.group();
    list.forEach(elem => console.info(elem))
    console.groupEnd();
}



