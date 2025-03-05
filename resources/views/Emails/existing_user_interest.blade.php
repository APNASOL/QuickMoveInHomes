<!DOCTYPE html>
<html>

<head>
    <title></title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <link href="https://cdn.quilljs.com/1.3.6/quill.snow.css" rel="stylesheet">
    <style type="text/css">
        <blade media|%20screen%20%7B%0D><blade font|-face%20%7B%0D>font-family: 'Lato';
        font-style: normal;
        font-weight: 400;
        src: local('Lato Regular'),
        local('Lato-Regular'),
        url(https://fonts.gstatic.com/s/lato/v11/qIIYRU-oROkIk8vfvxw6QvesZW2xOQ-xsNqO47m55DA.woff) format('woff');
        }

        <blade font|-face%20%7B%0D>font-family: 'Lato';
        font-style: normal;
        font-weight: 700;
        src: local('Lato Bold'),
        local('Lato-Bold'),
        url(https://fonts.gstatic.com/s/lato/v11/qdgUG4U09HnJwhYI-uK18wLUuEpTyoUstqEm5AMlJo4.woff) format('woff');
        }

        <blade font|-face%20%7B%0D>font-family: 'Lato';
        font-style: italic;
        font-weight: 400;
        src: local('Lato Italic'),
        local('Lato-Italic'),
        url(https://fonts.gstatic.com/s/lato/v11/RYyZNoeFgb0l7W3Vu1aSWOvvDin1pK8aKteLpeZ5c0A.woff) format('woff');
        }

        <blade font|-face%20%7B%0D>font-family: 'Lato';
        font-style: italic;
        font-weight: 700;
        src: local('Lato Bold Italic'),
        local('Lato-BoldItalic'),
        url(https://fonts.gstatic.com/s/lato/v11/HkF_qI1x_noxlxhrhMQYELO3LdcAZYWl9Si6vvxL-qU.woff) format('woff');
        }
        }

        /* CLIENT-SPECIFIC STYLES */

        body {
            height: 100% !important;
            margin: 0 !important;
            padding: 0 !important;
            width: 100% !important;
        }

        /* iOS BLUE LINKS */
        a[x-apple-data-detectors] {
            color: inherit !important;
            text-decoration: none !important;
            font-size: inherit !important;
            font-family: inherit !important;
            font-weight: inherit !important;
            line-height: inherit !important;
        }

        /* MOBILE STYLES */
        <blade media|%20screen%20and%20(max-width%3A600px)%20%7B%0D>h1 {
            font-size: 32px !important;
            line-height: 32px !important;
        }
        }

        body,
        table,
        td,
        a {
            -webkit-text-size-adjust: 100%;
            -ms-text-size-adjust: 100%;
        }

        table,
        td {
            mso-table-lspace: 0pt;
            mso-table-rspace: 0pt;
        }

        img {
            -ms-interpolation-mode: bicubic;
        }

        /* RESET STYLES */
        img {
            border: 0;
            height: auto;
            line-height: 100%;
            outline: none;
            text-decoration: none;
        }

        table {
            border-collapse: collapse !important;
        }

        body {
            height: 100% !important;
            margin: 0 !important;
            padding: 0 !important;
            width: 100% !important;
        }

        /* iOS BLUE LINKS */
        a[x-apple-data-detectors] {
            color: inherit !important;
            text-decoration: none !important;
            font-size: inherit !important;
            font-family: inherit !important;
            font-weight: inherit !important;
            line-height: inherit !important;
        }

        /* MOBILE STYLES */
        <blade media|%20screen%20and%20(max-width%3A600px)%20%7B%0D>h1 {
            font-size: 32px !important;
            line-height: 32px !important;
        }
        }

        /* ANDROID CENTER FIX */
        div[style*="margin: 16px 0;"] {
            margin: 0 !important;
        }

    </style>
</head>

<body style="background-color: white    ; margin: 0 !important; padding: 0 !important;">
    <!-- HIDDEN PREHEADER TEXT -->
    @php
        $external_website = getExternalWebsiteData();
    @endphp
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
        <!-- LOGO -->
        <tr>
            <td bgcolor="#163259" align="center">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                    <tr>
                        <td align="center" valign="top" style="padding: 40px 10px 40px 10px;"> </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#163259" align="center" style="padding: 0px 10px 0px 10px;">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                    <tr>
                        <td bgcolor="#ffffff" align="center" valign="top"
                            style="padding: 40px 20px 20px 20px; border-radius: 4px 4px 0px 0px; color: #111111; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; letter-spacing: 4px; line-height: 48px;">
                            <h1 style="font-size: 48px; font-weight: 400; margin: 2; color:#163259;">


                                <img src="{{ $external_website->black_logo }}" width="160" alt="Logo" />


                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td bgcolor="#f4f4f4" align="center" style="padding: 0px 10px 0px 10px;">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">

                    <tr>
                        <td bgcolor="#ffffff" align="left">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tr>
                                    <td bgcolor="white" align="center" style="padding: 20px 30px 60px 30px;">
                                        <table border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="center" style="border-radius: 3px; text-align: justify"
                                                    bgcolor="white">

                                                    <h2>Hello, {{ $name }}!</h2>
                                                    <p>You have shown interest in the following property:</p>

                                                    <h3 style="color:#163259;">Property Details:</h3>
                                                    <p><strong style="color:#163259;">Property Name:</strong>
                                                        {{ $property->title }}</p>


                                                    <h3 style="color:#163259;">Agent Details:</h3>
                                                    <p><strong style="color:#163259;">Agent Name:</strong>
                                                        {{ $agent->name }}</p>
                                                    <p><strong style="color:#163259;">License Number:</strong>
                                                        {{ $agent->license_number }}</p>

                                                    <p><strong>Our agent will contact you soon. Stay connected!</strong>
                                                    </p>

                                                    <p>Thank you for your interest!</p>

                                                </td>
                                            </tr>
                                        </table>


                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr> <!-- COPY -->

                    {{-- <tr>
                        <td bgcolor="#ffffff" align="left" style="padding: 0px 30px 20px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
                            <p style="margin: 0;">If you have any questions, just reply to this email&mdash;we're always happy to help out.</p>
                        </td>
                    </tr> --}}
                    <tr>
                        <td bgcolor="#ffffff" align="left"
                            style="padding: 0px 30px 40px 30px; border-radius: 0px 0px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
                            <p style="margin: 0; color:#163259;">{{ $external_website->name }},
                                {{ ("Team") }}</p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        {{-- <tr>
            <td bgcolor="#f4f4f4" align="center" style="padding: 30px 10px 0px 10px;">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                    <tr>
                        <td bgcolor="#FFECD1" align="center" style="padding: 30px 30px 30px 30px; border-radius: 4px 4px 4px 4px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 18px; font-weight: 400; line-height: 25px;">
                            <h2 style="font-size: 20px; font-weight: 400; color: #111111; margin: 0;">Visit our website</h2>
                            <p style="margin: 0;"><a href="#" target="_blank" style="color: rgb(255,193,7);">We&rsquo;re here to help you out</a></p>
                        </td>
                    </tr>
                </table>
            </td>
        </tr> --}}
        <tr>
            <td bgcolor="#f4f4f4" align="center" style="padding: 0px 10px 0px 10px;">
                <table border="0" cellpadding="0" cellspacing="0" width="100%" style="max-width: 600px;">
                    <tr>
                        <td bgcolor="#f4f4f4" align="left"
                            style="padding: 0px 30px 30px 30px; color: #666666; font-family: 'Lato', Helvetica, Arial, sans-serif; font-size: 14px; font-weight: 400; line-height: 18px;">

                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>

</html>

<script>
    import "@vueup/vue-quill/dist/vue-quill.snow.css";

</script>
