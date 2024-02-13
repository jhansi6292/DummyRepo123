using my.bookshop as my from '../db/data-model';
using demo as dbmodel from '../db/schema';

service CatalogService {
    entity Books             as projection on my.Books;
}

service ProjectService @(path: '/ProjectService') {
    entity Books             as projection on my.Books;

    entity SrvUsers          as projection on dbmodel.Users
                                where
                                        id > 1000
                                    and id < 4000;

    entity User1             as
        select
            id,
            name,
            gender,
            case when gender = 'female'
                then
                    'FEMALE'
                else
                    'MALE'
            end as CalculatedColumn:String(10)
    from dbmodel.Users;

    entity UserContactDetail as
        projection on dbmodel.Users
        excluding {
            name,
            gender
        };

    entity SrvProjects       as projection on dbmodel.Projects;
}
