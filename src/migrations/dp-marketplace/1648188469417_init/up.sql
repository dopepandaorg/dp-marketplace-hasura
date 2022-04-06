SET check_function_bodies = false;
CREATE FUNCTION public.set_current_timestamp_updated_at() RETURNS trigger
    LANGUAGE plpgsql
    AS $$
DECLARE
  _new record;
BEGIN
  _new := NEW;
  _new."updated_at" = NOW();
  RETURN _new;
END;
$$;
CREATE TABLE public.categories (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name text NOT NULL,
    slug text NOT NULL
);
COMMENT ON TABLE public.categories IS 'A collection of categories';
CREATE TABLE public.contest_entries (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    contest_id uuid NOT NULL,
    title text NOT NULL,
    description text NOT NULL,
    creator text NOT NULL,
    thumbnail_url text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL
);
COMMENT ON TABLE public.contest_entries IS 'A collection of contest entries';
CREATE TABLE public.contests (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title text NOT NULL,
    slug text NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    thumbnail_image_url text,
    creator text
);
COMMENT ON TABLE public.contests IS 'A collection of contests';
CREATE TABLE public.profile_followers (
    wallet text NOT NULL,
    follower_wallet text NOT NULL,
    follow_date timestamp without time zone DEFAULT now() NOT NULL
);
COMMENT ON TABLE public.profile_followers IS 'A collection of profile followers';
CREATE TABLE public.profiles (
    wallet text NOT NULL,
    display_name text,
    handle text
);
COMMENT ON TABLE public.profiles IS 'A collection for profiles';
ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_slug_key UNIQUE (slug);
ALTER TABLE ONLY public.contest_entries
    ADD CONSTRAINT contest_entries_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.contests
    ADD CONSTRAINT contests_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.contests
    ADD CONSTRAINT contests_slug_key UNIQUE (slug);
ALTER TABLE ONLY public.profile_followers
    ADD CONSTRAINT profile_followers_pkey PRIMARY KEY (wallet, follower_wallet);
ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_handle_key UNIQUE (handle);
ALTER TABLE ONLY public.profiles
    ADD CONSTRAINT profiles_pkey PRIMARY KEY (wallet);
CREATE TRIGGER set_public_contest_entries_updated_at BEFORE UPDATE ON public.contest_entries FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_contest_entries_updated_at ON public.contest_entries IS 'trigger to set value of column "updated_at" to current timestamp on row update';
CREATE TRIGGER set_public_contests_updated_at BEFORE UPDATE ON public.contests FOR EACH ROW EXECUTE FUNCTION public.set_current_timestamp_updated_at();
COMMENT ON TRIGGER set_public_contests_updated_at ON public.contests IS 'trigger to set value of column "updated_at" to current timestamp on row update';
ALTER TABLE ONLY public.contest_entries
    ADD CONSTRAINT contest_entries_contest_id_fkey FOREIGN KEY (contest_id) REFERENCES public.contests(id) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.contest_entries
    ADD CONSTRAINT contest_entries_creator_fkey FOREIGN KEY (creator) REFERENCES public.profiles(wallet) ON UPDATE RESTRICT ON DELETE RESTRICT;
ALTER TABLE ONLY public.profile_followers
    ADD CONSTRAINT profile_followers_wallet_fkey FOREIGN KEY (wallet) REFERENCES public.profiles(wallet) ON UPDATE RESTRICT ON DELETE RESTRICT;
