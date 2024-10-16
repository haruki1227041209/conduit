import localFont from "next/font/local";
import "./globals.css";
import Header from "./components/header";
import Footer from "./components/footer";

const geistSans = localFont({
    src: "./fonts/GeistVF.woff",
    variable: "--font-geist-sans",
    weight: "100 900",
});
const geistMono = localFont({
    src: "./fonts/GeistMonoVF.woff",
    variable: "--font-geist-mono",
    weight: "100 900",
});

export const metadata = {
    title: "Create Next App",
    description: "Generated by create next app",
};

export default function RootLayout({ children }) {
    return (
        <html lang="en">
            <head>
                <meta charset="utf-8" />
                <link
                    href="//code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css"
                    rel="stylesheet"
                    type="text/css"
                />
                <link
                    href="//fonts.googleapis.com/css?family=Titillium+Web:700|Source+Serif+Pro:400,700|Merriweather+Sans:400,700|Source+Sans+Pro:400,300,600,700,300italic,400italic,600italic,700italic"
                    rel="stylesheet"
                    type="text/css"
                />
                <link
                    rel="stylesheet"
                    href="//demo.productionready.io/main.css"
                />
            </head>
            <body className={`${geistSans.variable} ${geistMono.variable}`}>
                <Header />
                {children}
                <Footer />
            </body>
        </html>
    );
}
