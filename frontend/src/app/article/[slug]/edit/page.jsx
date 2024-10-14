"use client";

import { useEffect, useState } from "react";
import axios from "axios";
import { useRouter } from "next/navigation";

const Edit = ({ params }) => {
    const { slug } = params;

    const [article, setArticle] = useState({
        article: {
            title: "",
            description: "",
            body: "",
            tag_list: "",
        },
    });

    const router = useRouter();

    useEffect(() => {
        const getArticle = async () => {
            const res = await axios.get(
                `http://localhost:3000/api/articles/${slug}`
            );
            setArticle(res.data);
        };
        getArticle();
    }, [slug]);

    const token =
        "eyJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxLCJleHAiOjE3Mjk3ODY3MjV9.oXF7lN9CVA3jHCpVr2eofUnjyb5jyzYCz4KjCEbJ6zo";

    const handleSubmit = async (e) => {
        e.preventDefault();

        const tagListArray = article.tag_list
            .split(",")
            .map((tag) => tag.trim());

        const res = await axios.put(
            `http://localhost:3000/api/articles/${slug}`,
            {
                article: {
                    title: article.title,
                    description: article.description,
                    body: article.body,
                    tag_list: tagListArray,
                },
            },
            {
                headers: {
                    Authorization: `Bearer ${token}`,
                },
            }
        );
        router.push("/");
    };

    const handleChange = (e) => {
        const { name, value } = e.target;
        setArticle((prevArticle) => ({
            ...prevArticle,
            [name]: value,
        }));
    };
    return (
        <>
            <div class="editor-page">
                <div class="container page">
                    <div class="row">
                        <div class="col-md-10 offset-md-1 col-xs-12">
                            {/* <ul class="error-messages">
                          <li>That title is required</li>
                      </ul> */}

                            <form onSubmit={handleSubmit}>
                                <fieldset>
                                    <fieldset class="form-group">
                                        <input
                                            type="text"
                                            class="form-control form-control-lg"
                                            placeholder="Article Title"
                                            name="title"
                                            value={article.title}
                                            onChange={handleChange}
                                        />
                                    </fieldset>
                                    <fieldset class="form-group">
                                        <input
                                            type="text"
                                            class="form-control"
                                            placeholder="What's this article about?"
                                            name="description"
                                            value={article.description}
                                            onChange={handleChange}
                                        />
                                    </fieldset>
                                    <fieldset class="form-group">
                                        <textarea
                                            class="form-control"
                                            rows="8"
                                            placeholder="Write your article (in markdown)"
                                            name="body"
                                            value={article.body}
                                            onChange={handleChange}
                                        ></textarea>
                                    </fieldset>
                                    <fieldset class="form-group">
                                        <input
                                            type="text"
                                            class="form-control"
                                            placeholder="Enter tags"
                                            name="tag_list"
                                            value={article.tag_list}
                                            onChange={handleChange}
                                        />
                                        <div class="tag-list">
                                            <span class="tag-default tag-pill">
                                                {" "}
                                                <i class="ion-close-round"></i>{" "}
                                                tag{" "}
                                            </span>
                                        </div>
                                    </fieldset>
                                    <button
                                        class="btn btn-lg pull-xs-right btn-primary"
                                        type="submit"
                                    >
                                        Publish Article
                                    </button>
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </>
    );
};

export default Edit;
